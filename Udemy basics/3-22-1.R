##loops##

#apply
x = matrix(c(1:9), nr=3, byrow = T)

apply(x, 1, mean)

apply(x, 2, mean)

apply(x, 1, plot)

?tapply
?sapply
?vapply
?rapply
?eapply
?mapply
?replicate
?by
