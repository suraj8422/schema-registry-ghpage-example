# To make it compatible with smity translation

1. Change `paths` value to `paths: {}` since we don't need paths
1. Add `tags` section:
   ```json
   {
     "name": "<event name, not sure if it is used anywhere>",
     "x-displayName": "<event name that is displayed in the sidebar and each section header>",
     "description": "<description that is used in the main body. the <SchemaDefinition> reference needs to be included and reference your components>"
   }
   ```
1. Generate the HTML by referencing the schema:
   ```bash
   $ docker run --rm -v $PWD:/spec redocly/cli build-docs schema-registry-tlmt-viewport.json -o index.html
   ```

# To run and build as Docker container

1. Build Docker image locally
   ```bash
   $ docker build -f Dockerfile -t redoc .
   ```
1. Run the built docker image, mounting the current directory so that the spec can be read and the generated HTML can be saved on the host machine.
   ```bash
   $ docker run --rm -v $PWD:/spec redoc redocly build-docs /spec/schema-registry-tlmt-viewport.json -o /spec/index.html
   ```
1. HTML file will be available at `./index.html`

# Reference

Displaying schemas with redoc: https://redocly.com/blog/display-schemas/
