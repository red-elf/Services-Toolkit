# Services Toolkit

Tool for instantiating services.

## Supported technologies and frameworks

- C++ / Drogon, recipe name: `CPP_Drogon`

## How to use it?

The following command illustrates use of the toolkit:

```bash
sh services-toolkit.sh Service-Name ./Where-To-Instantiate true true CPP_Drogon
```

Where the parameters are:

- The name of the service
- Where to instantiate (path to directory)
- Generate API interface directory: true/false
- Generate implementation directory: true/false
- Technology recipe to use
