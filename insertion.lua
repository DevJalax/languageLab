function insertion_sort(arr)
    local len = #arr
    for i = 2, len do
        local key = arr[i]
        local j = i - 1
        while j > 0 and arr[j] > key do
            arr[j + 1] = arr[j]
            j = j - 1
        end
        arr[j + 1] = key
    end
    return arr
end

arr = {64, 25, 12, 22, 11}
print(table.concat(insertion_sort(arr), ", "))
