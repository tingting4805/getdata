Peer Assessment Project for _Coursera Course - Getting and Cleaning data_
=======

What are included...
1. ``run_analysis.R`` -- The code to process data from ``UCI HAR Dataset``. It downloads original ``zip`` file to local, unzip it, and load in data to R. Afterwards, it process data by combining test and train datasets. ``subject`` and ``activity`` are combined into data accordingly to appropriately indicate the background information for each set of measurements. It then subsets out features whose name contains ``mean()`` or ``std()``. Tidy data is exported as ``tidy.csv``. Furthermore, the data fram of ``tidy`` is molten and ``dcast`` to give average values for each measure given each unique pair of ``activity`` and ``subject``.
2. ``tidy.csv`` -- Output of ``run_analysis.R``, pure clean data.
3. ``tidyMean.csv`` -- Output of ``run_analysis.R``, clean data with only calculated means.
4. ``Codebook.md`` -- Codebook for ``tidy.csv`` and ``tidyMean.csv``.