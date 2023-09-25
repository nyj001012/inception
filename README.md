# Inception
## Before run
### Please create `index.php` in `/home/yena/data/wordpress` like this:

```php
<!DOCTYPE HTML>
<TITLE> This is Inception page </TITLE>
<HTML>
<BODY>
	<?php
		echo "Hello World :)"
	?>
</BODY>
</HTML>
```

### Add `yena.42.fr` to `/etc/hosts` like this:
```
127.0.0.1	localhost yena.42.fr
```

## How to run
1. Run `make` in root folder which is `Makefile` in.
2. After all containers are up, then put `https://yena.42.fr` on internet.

## Related my blog posts (Korean)
<https://nyj001012.github.io/42_seoul/inception/>
