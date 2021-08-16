/*

This is small tool to debug hashes for keycloak

COMPILE: javac hashgen.java
RUN: java -cp . hashgen {Password} {SaltInBase64} {Iterations} {PBKDF2_ALGORITHM}
Examples:
1) java -cp . hashgen hashcat bYjGueAuZgUG2URhIui3zg== 20000 PBKDF2WithHmacSHA1
Hash: Ir7uS0o9ouav1VCly0801VyioaQ/1sjwViHFmgD4kakDzzI39fRSifJutjbkd33U914v9QMVy+pF5k+xp+86cQ==
2) java -cp . hashgen hashcat bYjGueAuZgUG2URhIui3zg== 100000 PBKDF2WithHmacSHA256
Hash: 1IqX6hPxxAGwf/aZUUTKpZzf7MLYTLWNFTtGwTfwQA9mU04tA8M4Y1d2yAwF6MFWOiYZpEnIX//RdsY81UGnQw==
3) java -cp . hashgen hashcat bYjGueAuZgUG2URhIui3zg== 27500 PBKDF2WithHmacSHA512
Hash: MTkajtRaak3UDWUlYANtTt/D+CpYSq9OK0Yzs5WTz32eydupgcNE88f8SMNUhCHtwGiFVkfTKAIZynCa3i46Iw==
*/

import java.util.Base64;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

public class hashgen {
 public static final int DERIVED_KEY_SIZE = 512;
 public static void main(String[] args) throws Exception {
  try{
   String p = args[0]; System.out.println("Password: " + p);
   String s = args[1]; System.out.println("Salt: " + s);
   int i = Integer.parseInt(args[2]); System.out.println("Iterations: " + i);
   String a = args[3]; System.out.println("PBKDF2_Algorithm: " + a);
   PBEKeySpec spec = new PBEKeySpec(p.toCharArray(), Base64.getDecoder().decode(s), i, DERIVED_KEY_SIZE);
   SecretKeyFactory skf = null;
   try { skf = SecretKeyFactory.getInstance(a); } 
   catch (NoSuchAlgorithmException ignore) { System.out.println("NoSuchAlgorithmException: " + a); }
   byte[] hash = skf.generateSecret(spec).getEncoded();
   System.out.println("Hash: " + Base64.getEncoder().encodeToString(hash));
  } catch( Exception e ) { 
   System.out.println("Exception: " + e);
   e.printStackTrace();
}}}
