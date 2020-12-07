class Plane
  def seat_for(boarding_pass)
    row = partition_search_for(boarding_pass.row_partitions, 128)
    column = partition_search_for(boarding_pass.column_partitions, 8)

    (row * 8) + column
  end

  private

  def partition_search_for(partitions, size)
    start_range = 0
    end_range = size
    partitions.each do |partition|
      midpoint = (start_range + end_range) / 2
      if %w(F L).include?(partition)
        end_range = midpoint
      else
        start_range = midpoint
      end
    end
    start_range
  end
end
