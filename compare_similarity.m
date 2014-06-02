function [dis] = compare_similarity(descriptor_left, descriptor_right, method)
    if strcmp(method,'ssd')
        dis = sum((descriptor_left-descriptor_right).^2)/size(descriptor_left, 2);
    elseif strcmp(method,'nor_cor')
        x = descriptor_left-mean(descriptor_left);
        c = descriptor_right-mean(descriptor_right);
        x = x/sqrt(sumsqr(x));
        c = c/sqrt(sumsqr(c));
        dis = x*c';
    end
end