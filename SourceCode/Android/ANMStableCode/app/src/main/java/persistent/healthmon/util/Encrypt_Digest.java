package persistent.healthmon.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by harshal_patil on 3/17/2016.
 */
public class Encrypt_Digest {

        /**
         * function md5 encryption for passwords
         *
         * @param password
         * @return passwordEncrypted
         */
        public static final String encrypt(final String password) {
            try {

                MessageDigest digest = MessageDigest
                        .getInstance("MD5");
                digest.update(password.getBytes());
                byte messageDigest[] = digest.digest();

                StringBuffer hexString = new StringBuffer();
                for (int i = 0; i < messageDigest.length; i++) {
                    String h = Integer.toHexString(0xFF & messageDigest[i]);
                    while (h.length() < 2)
                        h = "0" + h;
                    hexString.append(h);
                }
                return hexString.toString();

            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
            return "";
        }
    }

