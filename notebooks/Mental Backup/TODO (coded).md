IaC
Terraform + docker
Terraform + minikube/Kind
Ansible + vagrant

Mini demos
Throttling + Rate limit with system mapping in DB
JWT and auth
- Multiline run command mvn clean
- Conversion to pro
	- Granted Authority



---
# Passing dynamic values
## Through system property
```sh
mvn -Dmy.custom.prop=${{ secrets.FRENCH_KEYS }}
```

Read in Java
```java
private final String MY_KEY = System.getProperty("my.custom.prop");
```
## Through environment variables
### Gradle
In workflow
```yml
  - name: Build app
    env: MY_KEY: ${{ secrets.FRENCH_KEYS }}
    run: ./gradlew build
```

Read in Java
```java
private final String MY_KEY = System.getenv("FRENCH_KEYS");
```

### Maven
Through configuration (application.properties or application.yml)
application.yml
```yaml
jwt:
	secret:
		key: ${JWT_SECRET_KEY}
```
application.properties
```ini
jwt.secret.key=${JWT_SECRET_KEY}
```

Read configuration
```java
@Value("${jwt.secret.key}")
private String secretKey
```

---

## JWT parts

**JOSE header** (JSON Object Signing and Encryption)
```json
{
	"alg": "HS256",
	"typ": "JWT"
}
```

**JWS payload** (JSON Web Signature)
```json
{
	"sub": "<main data ex. username>",
	"iat": 1516239022,
	"exp": 1531762065,
	"iss": "https://auth.example.com",
	"aud": "https://api.example.com",
	"jti": "66ced087-e09e-4892-94f2-2f782f068cda"
}
```
- `iat` - Issued At (unix epoch)
- `exp` - Expiration (unix epoch)
- `iss` - Issuer
- `aud` - Audience of the token
- `jti` - JSON web token ID

**Signature**
Signing process
1. Concatenate the header and payload
```ts
base64(Header) + "." + base64(Payload)
```

2. Run HmacSHA256 on the concatenated string
```ts
hmacSha256(
	secret: SECRET_KEY,
	message: base64(Header) + "." + base64(Payload)
)
```

3. Base64 encode the resulting binary signature
```ts
base64(signature)
```

4. Concatenate the JWT parts using "."
```ts
base64(Header) + "." + base64(Payload) + "." + base64(Signature)
```

---
## GitHub name cleanup

```sh
git filter-repo --force --email-callback "return b'freisoric@outlook.com' if email == b'xgoliath@protonmail.com' else email" --name-callback "return b'freix-st' if name == b'doubleskeleton' else name"
```