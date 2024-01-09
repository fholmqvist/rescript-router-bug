import {
  QueryClient,
  QueryClientProvider,
  useQuery,
} from '@tanstack/react-query'

export function Provider(children) {
  const client = new QueryClient({
    defaultOptions: {
      queries: {
        refetchOnMount: false,
        refetchOnWindowFocus: false,
        refetchOnReconnect: false,
        keepPreviousData: true,
        refetchIntervalInBackground: false,
        staleTime: 1000 * 60 * 2,
        cacheTime: 1000 * 60 * 2,
      },
    },
  })

  return <QueryClientProvider client={client}>{children}</QueryClientProvider>
}

const fetchTodos = async () =>
  (await fetch(`https://dummyjson.com/todos`)).json()

export function todosQuery() {
  return useQuery({
    queryKey: ['todos'],
    queryFn: fetchTodos,
  })
}
