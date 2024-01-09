@react.component
let make = (~title: string) => {
  let todos = Queries.getTodos()

  <div>
    <h2> {title->React.string} </h2>
    {switch todos {
    | {isLoading: true} => "Loading..."->React.string
    | {data: Some(todos), isLoading: false, isError: false} =>
      <ul>
        {Belt.Array.map(todos.todos, todo =>
          <li
            key={todo.id->Belt.Int.toString}
            className={(todo.completed ? "line-through" : "") ++ " select-none"}>
            {todo.todo->React.string}
          </li>
        )->React.array}
      </ul>
    | _ => "Unexpected error..."->React.string
    }}
  </div>
}
