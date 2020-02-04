package pl.coderslab.rentier.beans;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;
import pl.coderslab.rentier.entity.ProductShop;
import pl.coderslab.rentier.pojo.CartItem;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Cart {

    private List<CartItem> cartItems = new ArrayList<>();
    private Integer totalQuantity = 0;
    private BigDecimal totalValue = new BigDecimal(0);

    public void addToCart(CartItem cartItem) {

        this.cartItems.add(cartItem);
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {

        this.cartItems = cartItems;
    }

    public Integer getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity() {
        this.totalQuantity = calcTotalQuantity();
    }

    public BigDecimal getTotalValue() {
        return totalValue;
    }

    public void setTotalValue() {
        this.totalValue = calcTotalValue();
    }

    public Integer calcTotalQuantity() {

        List<CartItem> cartItemList = this.cartItems;

        return cartItemList.stream()
                .map(CartItem::getQuantity).mapToInt(Integer::intValue).sum();

    }

    public BigDecimal calcTotalValue() {

        BigDecimal totalPrice = new BigDecimal(0);

        List<CartItem> cartItemList = this.cartItems;

        for (CartItem cartItem: cartItemList) {
            BigDecimal prodQuantity = BigDecimal.valueOf(cartItem.getQuantity());
            BigDecimal prodPrice = cartItem.getProduct().getPriceGross();
            totalPrice = totalPrice.add(prodPrice.multiply(prodQuantity));

        }

        return totalPrice;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartItems=" + cartItems +
                ", totalQuantity=" + totalQuantity +
                ", totalValue=" + totalValue +
                '}';
    }
}
