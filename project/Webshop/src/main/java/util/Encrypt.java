package util;

public class Encrypt {

    public static String encrypt(String str) {
        int num = 4;

        String rs = new StringBuilder(str).reverse().toString();

        char[] chars = rs.toCharArray();
        for (int i = 0; i < chars.length; i++) {
            chars[i] = (char) (chars[i] * num);
        }
        return new String(chars);
    }

    public static void main(String[] args) {
        String s = "Le Anh Huy";
        System.out.println(encrypt(s));
    }
}
