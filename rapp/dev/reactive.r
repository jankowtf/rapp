require("shiny")

values <- reactiveValues(A=10)
obsB <- observe({
  print(values$A + 1)
})

# Can use quoted expressions
obsC <- observe(quote({ print(values$A + 2) }), quoted = TRUE)

# To store expressions for later conversion to observe, use quote()
expr_q <- quote({ print(values$A + 3) })
obsD <- observe(expr_q, quoted = TRUE)

# In a normal Shiny app, the web client will trigger flush events. If you
# are at the console, you can force a flush with flushReact()
shiny:::flushReact()

envir <- new.env()
envir$.values <- reactiveValues(x_1 = 1, x_2 = TRUE)
envir$x_3_0 <- reactive({
  envir$.values$x_1 + 1
})
envir$x_3 <- isolate(envir$x_3_0())

envir$x_3
envir$.values[["x_1"]] <- 10


