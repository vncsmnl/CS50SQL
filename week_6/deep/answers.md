# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning
Reasons to adopt this approach: Random partitioning ensures that the observations are evenly distributed across all boats, which can help to prevent any single boat from becoming overwhelmed with data. This approach also makes it easier to add or remove boats from the system without affecting the overall distribution of data.
Reasons not to adopt this approach: However, this approach can make it more difficult for researchers to query the data, as they may need to run their queries on all boats in order to get a complete picture of the observations.

## Partitioning by Hour
Reasons to adopt this approach: Partitioning by hour can make it easier for researchers to query the data, as they will only need to run their queries on the boat that corresponds to the hour in which the observations were made. This approach can also help to reduce the load on individual boats, as the data is distributed more evenly across the system.
Reasons not to adopt this approach: However, this approach can lead to uneven distribution of data across the boats, as some hours may have more observations than others. This can cause some boats to become overwhelmed with data, while others have relatively little.

## Partitioning by Hash Value
Reasons to adopt this approach: Partitioning by hash value can help to ensure that the observations are evenly distributed across all boats, as each observation is assigned a unique hash value that corresponds to a specific boat. This approach can also make it easier to add or remove boats from the system without affecting the overall distribution of data.
Reasons not to adopt this approach: However, this approach can make it more difficult for researchers to query the data, as they may need to run their queries on all boats in order to get a complete picture of the observations. Additionally, this approach requires a consistent and evenly-distributed hash function, which can be difficult to implement.
