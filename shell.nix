{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  buildInputs = [
    pkgs.postgresql
  ];

  shellHook = ''
    
            # Create a temporary directory for database data
            mkdir -p .tmp/haskellers
            Initialize the database if it doesn't exist
            if [ ! -d ".tmp/haskellers/PG_VERSION" ]; then
             initdb -D .tmp/haskellers
            fi
            # Start PostgreSQL server with Unix socket in current directory
            pg_ctl -D .tmp/haskellers -l logfile -o "--unix_socket_directories='$PWD'" start
            # Create a test database (optional)
            createuser postgres -W 
            createdb haskellers
  '';

  # Optional: Stop PostgreSQL when exiting the shell
  # postShellHook = ''
  #   pg_ctl -D .tmp/mydb stop
  # '';
}
