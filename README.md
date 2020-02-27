# Basic showcase reproducing remote browser disconnect when running testcafe in docker uisng Create react app

## Reproduction Steps
1. Run `npm run docker:build`
2. Run `npm run docker:up`
3. Run `npm run docker:bash`
4. This will enter docker container, now run `npm ci`
5. Start the app using `npm start`, open browser on `http://localhost:3000/` to see if it works
6. Open new terminal and run testcafe in remote via `npm run e2e`

Example console log:
```shell script
    root@c00421a22268:/usr/app# npm run e2e
    
    > testcafecra@0.1.0 e2e /usr/app
    > testcafe remote
    
    Connecting 1 remote browser(s)...
    Navigate to the following URL from each remote browser.
    Connect URL: http://localhost:5080/browser/connect
    CONNECTED Chrome 79.0.3945.130 / macOS 10.14.5
    ERROR The following browsers disconnected: Chrome 79.0.3945.130 / macOS 10.14.5. Tests will not be run.
    
    Type "testcafe -h" for help.
    npm ERR! code ELIFECYCLE
    npm ERR! errno 1
    npm ERR! testcafecra@0.1.0 e2e: `testcafe remote`
    npm ERR! Exit status 1
    npm ERR! 
    npm ERR! Failed at the testcafecra@0.1.0 e2e script.
    npm ERR! This is probably not a problem with npm. There is likely additional logging output above.
    
    npm ERR! A complete log of this run can be found in:
    npm ERR!     /root/.npm/_logs/2020-02-27T10_24_27_777Z-debug.log
```

### Note
Running the same without docker works as expected, tests are run successfully
```shell script
    JAMB1P7HTDG:testcafe_docker_remote_issue sg0947214$ npm run e2e
    > testcafecra@0.1.0 e2e /Users/sg0947214/src/testcafe_docker_remote_issue
    > testcafe remote
    
    Connecting 1 remote browser(s)...
    Navigate to the following URL from each remote browser.
    Connect URL: http://localhost:5080/browser/connect
    CONNECTED Chrome 79.0.3945.130 / macOS 10.14.5
     Running tests in:
     - Chrome 79.0.3945.130 / macOS 10.14.5
    
     test
     ✓ initial
    
    
     1 passed (1s)
```

Tested on MacOS 14.15.0, multiple browsers and Docker version 19.03.5, build 633a0ea
