use std::collections::{BinaryHeap, HashMap};
use std::hash::Hash;

fn dijkstra<'a, T, F>(start: T, neighbors: F) -> HashMap<T, usize>
where
    T: Eq + Hash + Copy,
    F: Fn(T) -> Vec<(T, usize)>,
{
    let mut dist = HashMap::new();
    let mut heap = BinaryHeap::new();

    dist.insert(start, 0);
    heap.push((0, start));

    while let Some((cost, node)) = heap.pop() {
        let cost = -cost;
        if cost > *dist.get(&node).unwrap_or(&usize::max_value()) {
            continue;
        }

        for (neighbor, edge_cost) in neighbors(node) {
            let new_cost = cost + edge_cost;
            if new_cost < *dist.get(&neighbor).unwrap_or(&usize::max_value()) {
                heap.push((-new_cost, neighbor));
                dist.insert(neighbor, new_cost);
            }
        }
    }

    dist
}

fn main() {
    let neighbors = |node: &str| -> Vec<(&str, usize)> {
        match node {
            "A" => vec![("B", 10), ("C", 3)],
            "B" => vec![("C", 1), ("D", 2)],
            "C" => vec![("B", 4), ("D", 8), ("E", 2)],
            "D" => vec![("E", 7)],
            "E" => vec![("D", 9)],
            _ => Vec::new(),
        }
    };

    let distances = dijkstra("A", &neighbors);
    for (node, distance) in &distances {
        println!("Distance to {}: {}", node, distance);
    }
}
