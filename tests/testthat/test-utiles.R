 
mat = matrix(rnorm(40), nr = 4, ncol = 10)
rownames(mat) = letters[1:4]
colnames(mat) = letters[1:10]

d1 = dist(mat)
d2 = dist2(mat)

test_that("test dist and dist2", {
	expect_that(all(abs(d1 - d2) < 1e-10), is_identical_to(TRUE))
})

test_that("test default colors", {
	col = default_col(c("a", "b", "c"))
	expect_that(is.atomic(col), is_identical_to(TRUE))
	col = default_col(factor(c("a", "b", "c")))
	expect_that(is.atomic(col), is_identical_to(TRUE))
	col = default_col(1:10)
	expect_that(is.function(col), is_identical_to(TRUE))
})

test_that("test ks_dist", {
	m = matrix(rnorm(200), nc = 10)
	d1 = ComplexHeatmap:::ks_dist(m, mc.cores = 1)
	d2 = ComplexHeatmap:::ks_dist(m, mc.cores = 2)
	d3 = ComplexHeatmap:::ks_dist_1(m)
	expect_that(d1, is_identical_to(d2))
	expect_that(d2, is_identical_to(d3))

	lt = lapply(1:10, function(i) rnorm(runif(1, min = 10, max = 20)))
	d1 = ComplexHeatmap:::ks_dist(lt, mc.cores = 1)
	d2 = ComplexHeatmap:::ks_dist(lt, mc.cores = 2)
	d3 = ComplexHeatmap:::ks_dist_1(lt)
	expect_that(d1, is_identical_to(d2))
	expect_that(d2, is_identical_to(d3))
})

