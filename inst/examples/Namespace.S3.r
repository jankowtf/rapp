\dontrun{

## Informal use (intended mainly for rapid prototyping) //
## Takes *any* object and simply changes the class attributes
Namespace.S3(TRUE)  

## Formal use (explicitly using 'fields') //
Namespace.S3()
Namespace.S3(ns = "rapp")

## Recommended: inlcude namespace //
## Regardless if you plan on using this class in an informal or formal way
rapp::Namespace.S3()

}
