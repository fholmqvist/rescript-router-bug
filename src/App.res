type navLink = {
  name: string,
  href: string,
}

@react.component
let make = () => {
  let url = RescriptReactRouter.useUrl()

  let navigation = [
    {name: "Home", href: "/"},
    {name: "Todos", href: "/todos"},
    {name: "Todos/2", href: "/todos/2"},
  ]

  <Queries>
    <div>
      {navigation
      ->Belt.Array.map(item => {
        <button key={item.name} onClick={_ => RescriptReactRouter.push(item.href)}>
          {item.name->React.string}
        </button>
      })
      ->React.array}
      <div>
        {switch url.path {
        | list{} => <h2> {"Home"->React.string} </h2>
        | list{"todos"} => <Todos title="Todos" />
        | list{"todos", "2"} =>
          <>
            <Todos title="Todos/2" />
            <Todos title="Todos/2" />
          </>
        | _ => <div> {"Page not found"->React.string} </div>
        }}
      </div>
    </div>
  </Queries>
}
