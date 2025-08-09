- [x] [the Unix socket directories couldn't match between pg_ctl and psql](https://discourse.nixos.org/t/set-up-a-simple-postgres-instance/60280/2?u=dycan)
- [x] [Starting postgresql demands that /run/postgresql exists](https://github.com/NixOS/nixpkgs/issues/83770)

- [x] 似乎是沒有用https所以facebook login不行
      A: 用 warp-tls, devel.hs, port 8080 即可。

- [x] Facebook Developer的應用程式網域要用localhost，不能用127.0.0.1。Facebook Login至此成功了。
