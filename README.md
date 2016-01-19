# docker-quacode

Docker container that provides compiled Gecode and Quacode.

You can use it with:

```bash
sudo docker run -t -i bdamota/quacode bash
```
Then you can test some examples:

```bash
root@0ee58b331663:/# /usr/lib/quacode/nim-fibo
root@0ee58b331663:/# /usr/lib/quacode/matrix-game
root@0ee58b331663:/# /usr/lib/quacode/baker
root@0ee58b331663:/# /usr/lib/quacode/connect-four -row 4 -col 4
```
Or directly:

```bash
sudo docker run -t -i bdamota/quacode /usr/lib/quacode/nim-fibo
```
# docker-boinc-client
