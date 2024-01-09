type todo = {id: int, todo: string, completed: bool}

type todos = {todos: array<todo>}

type useQuery<'t> = {isLoading: bool, isError: bool, data: option<'t>}

@module("./TanQuery")
external queryClient: unit => 't = "queryClient"

@module("./TanQuery")
external provider: React.element => React.element = "Provider"

@module("./TanQuery")
external getTodos: unit => useQuery<todos> = "todosQuery"

@react.component
let make = (~children: React.element) => {
    provider(children)
}
