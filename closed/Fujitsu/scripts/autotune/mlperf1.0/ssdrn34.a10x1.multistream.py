# "Typical" format which doesn't differ much from JSON
gpu_batch_size = [4 ]
gpu_multi_stream_samples_per_query = [ 18, 19 ]
# gpu_multi_stream_samples_per_query = [16, 17, 18, 19, 20, 21]
gpu_copy_streams = [ 1, 2 ]
gpu_inference_streams = [ 1, 2 ]

# gpu_batch_size = [4, 8, 10, 12 ]

# ... But, we can do arbitrary computation to calculate other variables
# Variables with leading underscores are not considered "public", and should be used for private computation

# We can even use external libraries to do wild stuff:
# Note that functions which are not preceeded by META_ are considered "private" and not exposed to grid.py/the scheduler.

# We have some a posteriori knowledge that certain parameters are only meaningful at runtime and not build time
# This meta function let's the scheduler know that to order runs in such a way to minimize the number of rebuilds
def META_get_no_rebuild_params():
    return ["gpu_copy_streams", "gpu_inference_streams", "gpu_multi_stream_samples_per_query"]

# It's sometimes easier to just declare some arbitrary list of parameters, and then describe a predicate which filters that list.
# Note well that we never specify "audio_buffer_num_lines" because config is the updated default config.
def META_is_config_valid(config):
    return config["gpu_copy_streams"] <= config["gpu_inference_streams"]
