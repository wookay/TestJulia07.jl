using VisualDL
train_logger = VisualDLLogger("tmp", 1, "train")
test_logger = as_mode(train_logger, "test")

for i in 1:100
    with_logger(train_logger) do
       @log_histogram h0=(i, randn(100))
    end
end
