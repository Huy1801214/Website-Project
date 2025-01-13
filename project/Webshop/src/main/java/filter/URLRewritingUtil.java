package filter;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class URLRewritingUtil {
    public static String encodeURLWithSession(String url,String sessionId) {

        Pattern pattern = Pattern.compile("([^;]*)(;jsessionid=[^;]*)?");
        Matcher matcher = pattern.matcher(url);
        String finalUrl = url;

        if (matcher.find()) {
            String urlWithoutSession = matcher.group(1);
            if (url.contains("?"))
            {
                finalUrl = String.format("%s&jsessionid=%s",urlWithoutSession, sessionId);

            }else{
                finalUrl = String.format("%s;jsessionid=%s",urlWithoutSession, sessionId);
            }
        }
        return finalUrl;
    }
}
