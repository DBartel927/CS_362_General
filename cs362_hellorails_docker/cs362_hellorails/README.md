# Hello Rails Docker Container

1. Linux (non-WSL) users only: before the first run, run this on the
   command line:

   ```
   export MYUID=$(id -u)
   export MYGID=$(id -g)
   ```

   After the container runs once, there's no need to do this again.

2. Run the container:

   ```
   docker compose run --service-ports --rm cs362-hellorails bash
   ```

3. Start the [Getting
   Started](https://guides.rubyonrails.org/getting_started.html)
   tutorial at section 3.2.

   Don't worry that we're not at the latest version.

   If you run into trouble with the setup or running the server, see
   Troubleshooting, below.

   **NOTE**: if the `rails new store` command fails with a sqlite3
   error, edit the `Gemfile` in the `store/` directory and change the
   `sqlite3` line to be this:

   ```
   gem "sqlite3", "~> 1.7"
   ```

   Then go back and run `rails new store` again, answering `n` for all
   the overwrite prompts.

## Troubleshooting

### Web Browser Can't Connect

Be sure to run the server in the container with `rails server -b
0.0.0.0` so you can access `localhost:3000` in your browser from outside
the container.

### Wrong Directory

The `store` directory gets mapped into the container, so you can access
it with VS Code from outside the container. **But all the rails commands
from the tutorial must be run inside the container.**

### Cannot Render Console error

If you're getting an error from the server that looks something like
this:

```
Cannot render console from 172.19.0.1! Allowed networks:
127.0.0.1, 127.0.0.0/127.255.255.255, ::1
```

Take note of the IP address (`172.19.0.1` in this example) and remember
the first number (`172`). Then edit the file
`config/environments/development.rb`.

Inside the `Rails.application.configure` function, add a line that looks
like this, substituting the first number from your IP address:

```
config.web_console.permissions = '172.0.0.0/8'
```

Then restart the server.

### Nokogiri doesn't install

Change the gemfile to say:

```
gem "nokogiri", "= 1.14"
```

### Windows chmod permission errors

1. Remove all files from `store/`
2. `rails new store2`
3. Get it running from there.
4. Copy it into place: `cp -r store2/* store2/.* store`

