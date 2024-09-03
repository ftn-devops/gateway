package ftn.devops.gateway.config;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

@Configuration
@RequiredArgsConstructor
public class CorsFilterConfig {

    private static final String ALLOWED_HEADERS = "*";

    private static final String ALLOWED_METHODS = "*";

    private static final Long MAX_AGE_IN_SECONDS = 3600L; // 1 hour

    @Value("${devops.allowed-cors-origins}")
    private String[] allowedCorsOrigins;

    @Bean
    CorsWebFilter corsWebFilter() {
        var corsConfig = new CorsConfiguration();
        corsConfig.setAllowedOrigins(List.of(allowedCorsOrigins));
        corsConfig.setMaxAge(MAX_AGE_IN_SECONDS);
        corsConfig.addAllowedMethod(ALLOWED_METHODS);
        corsConfig.addAllowedHeader(ALLOWED_HEADERS);

        var source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", corsConfig);

        return new CorsWebFilter(source);
    }
}
