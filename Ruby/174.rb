def calculate_minimum_hp(dungeon)
    n = dungeon[0].size - 1
    need = [1/0.0] * n + [1]
    dungeon.reverse_each do |row|
        n.downto(0) do |j|
            need[j] = [need[j..j+1].min - row[j], 1].max
        end
    end
    need[0]
end
