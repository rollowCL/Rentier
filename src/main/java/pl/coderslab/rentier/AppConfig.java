package pl.coderslab.rentier;

import org.hibernate.jpa.HibernatePersistenceProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import pl.coderslab.rentier.converter.*;
import pl.coderslab.rentier.utils.BCrypt;
import pl.coderslab.rentier.utils.EmailUtil;

import javax.persistence.EntityManagerFactory;


@Configuration
@ComponentScan(basePackages = "pl.coderslab.rentier")
public class AppConfig implements WebMvcConfigurer {

    @Override
    public void addFormatters(FormatterRegistry registry)
    {
        registry.addConverter(getBrandConverter());
        registry.addConverter(getDeliveryMethodConverter());
        registry.addConverter(getOrderStatusConverter());
        registry.addConverter(getOrderTypeConverter());
        registry.addConverter(getPaymentMethodConverter());
        registry.addConverter(getProductCategoryConverter());
        registry.addConverter(getProductSizeConverter());
        registry.addConverter(getUserRoleConverter());
    }
    @Bean
    public BrandConverter getBrandConverter() {

        return new BrandConverter();
    }

    @Bean
    public DeliveryMethodConverter getDeliveryMethodConverter() {

        return new DeliveryMethodConverter();
    }

    @Bean
    public OrderStatusConverter getOrderStatusConverter() {

        return new OrderStatusConverter();
    }

    @Bean
    public OrderTypeConverter getOrderTypeConverter() {

        return new OrderTypeConverter();
    }

    @Bean
    public PaymentMethodConverter getPaymentMethodConverter() {

        return new PaymentMethodConverter();
    }

    @Bean
    public ProductCategoryConverter getProductCategoryConverter() {

        return new ProductCategoryConverter();
    }

    @Bean
    public ProductSizeConverter getProductSizeConverter() {

        return new ProductSizeConverter();
    }

    @Bean
    public UserRoleConverter getUserRoleConverter() {

        return new UserRoleConverter();
    }

    @Bean
    public EmailUtil emailUtil() {

        return new EmailUtil();

    }


//    @Bean
//    public FilterRegistrationBean <adminURLFilter> adminFilterRegistrationBean() {
//        FilterRegistrationBean < adminURLFilter > registrationBean = new FilterRegistrationBean();
//        adminURLFilter customURLFilter = new adminURLFilter();
//
//        registrationBean.setFilter(customURLFilter);
//        registrationBean.addUrlPatterns("/admin/*");
//        registrationBean.setOrder(2); //set precedence
//        return registrationBean;
//    }
//
//    @Bean
//    public FilterRegistrationBean <userURLFilter> userFilterRegistrationBean() {
//        FilterRegistrationBean < userURLFilter > registrationBean = new FilterRegistrationBean();
//        userURLFilter customURLFilter = new userURLFilter();
//
//        registrationBean.setFilter(customURLFilter);
//        registrationBean.addUrlPatterns("/user/*");
//        registrationBean.setOrder(2); //set precedence
//        return registrationBean;
//    }

    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
        LocalContainerEntityManagerFactoryBean factory =
                new LocalContainerEntityManagerFactoryBean();
        factory.setPersistenceProviderClass(HibernatePersistenceProvider.class);
        return factory;
    }

    @Bean
    public PlatformTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
        JpaTransactionManager txManager = new JpaTransactionManager();
        txManager.setEntityManagerFactory(entityManagerFactory);
        return txManager;
    }

    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
        multipartResolver.setMaxUploadSize(1148576);
        return multipartResolver;
    }


//    @Bean
//    public Validator validator() {
//        return new LocalValidatorFactoryBean();
//
//    }
//
//    @Bean(name="localeResolver")
//    public LocaleContextResolver getLocaleContextResolver() {
//        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
//        localeResolver.setDefaultLocale(new Locale("pl","PL"));
//        return localeResolver;
//    }

}
