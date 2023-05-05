# DF-Human-Readable

This script provides a human-readable output for the `df` command on z/OS USS systems that lack the `-h` option. It converts the sizes reported by the `df` command into a more readable format with units like K, M, G, T, and P.

## Usage

1. Save the script as `df_h.sh` in your local machine or clone the GitHub repository.

2. Make the script executable:


```

chmod +x df_h.sh

```

3. Run the script:


```

./df_h.sh

```

You can also pass additional parameters to the script, for example:


```

./df_h.sh /path/to/mountpoint

```

## Notes

This script is specifically designed for z/OS USS systems where the `df` command doesn't support the `-h` option. It might not be compatible with other systems or `df` implementations with a different output format.

