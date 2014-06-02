function [row_range_from, row_range_to, col_range_from, col_range_to, len] = descriptor_range(cur_row, cur_col, max_row, max_col, neighbor_size)
    if cur_row - neighbor_size < 1
        row_range_from = 1;
        row_range_to = cur_row + neighbor_size;
    elseif cur_row + neighbor_size > max_row
        row_range_from = cur_row - neighbor_size;
        row_range_to = max_row;
    else
        row_range_from = cur_row - neighbor_size;
        row_range_to = cur_row + neighbor_size;
    end
    if cur_col - neighbor_size < 1
        col_range_from = 1;
        col_range_to = cur_col + neighbor_size;
    elseif cur_col + neighbor_size > max_col
        col_range_from = cur_col - neighbor_size;
        col_range_to = max_col;
    else
        col_range_from = cur_col - neighbor_size;
        col_range_to = cur_col + neighbor_size;
    end
    len = (row_range_to - row_range_from + 1)*(col_range_to - col_range_from + 1);
end