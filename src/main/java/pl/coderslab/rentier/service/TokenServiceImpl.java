package pl.coderslab.rentier.service;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.coderslab.rentier.entity.Token;
import pl.coderslab.rentier.entity.User;
import pl.coderslab.rentier.repository.TokenRepository;

import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.time.ZoneId;

@Service
public class TokenServiceImpl implements TokenService {
    private final org.slf4j.Logger logger = LoggerFactory.getLogger(TokenServiceImpl.class);
    private final TokenRepository tokenRepository;

    @Value("${rentier.tokenTypePasswordReset}")
    private int tokenTypePasswordReset;


    public TokenServiceImpl(TokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }


    @Override
    public String generateToken(int len) {

        final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        SecureRandom rnd = new SecureRandom();

        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++)
            sb.append(AB.charAt(rnd.nextInt(AB.length())));

        return sb.toString();
    }

    @Override
    public void invalidateAllUserResetTokens(User user) {

        tokenRepository.invalidateUserTokens(user.getId(), tokenTypePasswordReset);

    }

    @Override
    public void saveToken(User user, String generatedToken, int tokenType) {

        Token token = new Token();
        token.setTokenType(tokenType);
        token.setCreateDate(LocalDateTime.now(ZoneId.of("Europe/Paris")));
        token.setExpiryDate(token.getCreateDate().plusHours(1));
        token.setValid(true);
        token.setUser(user);
        token.setTokenValue(generatedToken);

        tokenRepository.save(token);

    }

    @Override
    public boolean validateToken(String token, int tokenType) {

        return tokenRepository.existsTokenByTokenValueEqualsAndValidTrueAndExpiryDateAfterAndTokenType
                (token, LocalDateTime.now(ZoneId.of("Europe/Paris")), tokenType);
    }

    @Override
    public void invalidateToken(String token) {

        tokenRepository.invalidateToken(token);
    }


    @Override
    public User getUserForToken(String token) {

        return tokenRepository.findTokenByTokenValue(token).getUser();
    }
}
