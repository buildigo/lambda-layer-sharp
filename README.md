# AWS Sharp layer

This AWS lambda layer contains a pre-built [sharp](https://www.npmjs.com/package/sharp) npm library.

# Getting

A pre-built layer zip file is available on the [Releases page](../../releases).

You can import it into your AWS account through the Lambda console or with the following command:

```shell
aws lambda publish-layer-version \
    --layer-name sharp \
    --description "Sharp layer" \
    --license-info "Apache License 2.0" \
    --zip-file fileb://dist/sharp-layer.zip \
    --compatible-runtimes nodejs14.x nodejs16.x nodejs18.x \
    --compatible-architectures x86_64
```

# Building

Simply run (this will wipe your existing `node_modules/` directory):

```shell
npm run build
```

Build will be performed automatically upon deps installation.
The resulted lambda layer zip file will be saved to `dist/` directory.

This will also build a `*-fs.zip` file that contains only the node_modules folder
and can be bundled with a lambda function without the need for a layer.