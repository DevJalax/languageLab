type Edge = { Source: int; Destination: int; Weight: int }

let kruskal (n: int) (edges: Edge list) =
    let parent = Array.init n (fun i -> i)
    let findParent x =
        if parent.[x] <> x then
            parent.[x] <- findParent parent.[x]
        parent.[x]

    let rec union x y =
        let xParent = findParent x
        let yParent = findParent y
        if xParent <> yParent then
            parent.[xParent] <- yParent

    let edges = edges |> List.sortBy (fun edge -> edge.Weight)
    let mst = ref []
    let edgeCount = ref 0
    let i = ref 0
    while !edgeCount < n - 1 do
        let edge = edges.[!i]
        let x = findParent edge.Source
        let y = findParent edge.Destination
        if x <> y then
            mst := edge :: !mst
            edgeCount := !edgeCount + 1
            union x y
        i := !i + 1
    !mst

let edges = [{Source = 0; Destination = 1; Weight = 10};
             {Source = 0; Destination = 3; Weight = 5};
             {Source = 1; Destination = 2; Weight = 1};
             {Source = 2; Destination = 3; Weight = 2};
             {Source = 2; Destination = 4; Weight = 3}]

let mst = kruskal 5 edges
printfn "Minimum Spanning Tree: %A" mst
