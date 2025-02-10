-module(prims).
-export([mst/1]).

% Helper function to find the vertex with the minimum distance
% from the set of vertices not yet included in the MST
find_min_vertex(Graph, Visited) ->
    min_vertex = {1000000, 0},
    lists:foreach(fun({V, D}) ->
        case lists:member(V, Visited) of
            true ->
                ok;
            false ->
                if D < min_vertex#{distance} ->
                    min_vertex = {V, D}
                end
        end
    end, Graph),
    min_vertex.

% Prim's algorithm to find the MST of a graph
mst(Graph) ->
    % Initialize the MST with vertex 1
    mst = [],
    visited = [1],
    min_vertex = {1, 0},
    % Repeat until all vertices are included in the MST
    while length(visited) < length(Graph) do
        % Find the vertex with the minimum distance from the set of vertices
        % not yet included in the MST
        min_vertex = find_min_vertex(Graph, visited),
        % Add the vertex to the MST
        mst = [{min_vertex#{vertex}, min_vertex#{distance}}|mst],
        visited = [min_vertex#{vertex}|visited],
        % Update the distances of the neighboring vertices
        Graph = lists:map(fun({V, D}) ->
            case V of
                min_vertex#{vertex} ->
                    {V, D};
                _ ->
                    case lists:member(V, visited) of
                        true ->
                            {V, D};
                        false ->
                            case D > min_vertex#{distance} of
                                true ->
                                    {V, min_vertex#{distance}};
                                false ->
                                    {V, D}
                            end
                    end
            end
        end, Graph)
    end,
    mst.
