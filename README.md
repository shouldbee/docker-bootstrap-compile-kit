# docker-bootstrap-compile-kit

[Bootstrap] is a sleek, intuitive, and powerful front-end framework for faster and easier web development.
This is a docker image provides full compile kit for Bootstrap.

## Install

This docker image is available as an automated build on [the docker registry hub](https://registry.hub.docker.com/u/shouldbee/bootstrap-compile-kit/), so using it is as simple as running:


```console
$ docker run shouldbee/bootstrap-compile-kit
```

At first, you need to copy node_modules to host from the container, due to Grunt needs local NPM modules.

```console
$ wget https://github.com/twbs/bootstrap/archive/v3.2.0.zip
$ unzip v3.2.0.zip
$ cd bootstrap-3.2.0/
$ docker run --rm -v `pwd`:/host shouldbee/bootstrap-compile-kit cp -r /node_modules /host/node_modules
```

To further ease running, it's recommended to set up a much shorter function so that you can easily execute it as just `grunt`:

```
$ grunt () {
  docker run -it --rm --net host -v `pwd`:/host -w /host shouldbee/bootstrap-compile-kit grunt $@
}
```

This will create a temporary function. In order to make it persist reboots, you can append this exact line to your `~/.bashrc` (or similar) like this:

```console
$ declare -f grunt >> ~/.bashrc
```

## Usage

Usage from [Getting started · Bootstrap](http://getbootstrap.com/getting-started/#grunt)


> ### `grunt dist` (Just compile CSS and JavaScript)
> Regenerates the /dist/ directory with compiled and minified CSS and JavaScript files. As a Bootstrap user, this is normally the command you want.
> 
> ### `grunt watch` (Watch)
> Watches the Less source files and automatically recompiles them to CSS whenever you save a change.
>
> ### `grunt test` (Run tests)
> Runs JSHint and runs the QUnit tests headlessly in PhantomJS.
>
> ### `grunt` (Build absolutely everything and run tests)
> Compiles and minifies CSS and JavaScript, builds the documentation website, runs the HTML5 validator against the docs, regenerates the Customizer assets, and more. Usually only necessary if you're hacking on Bootstrap itself.


[Bootstrap]: https://github.com/twbs/bootstrap
