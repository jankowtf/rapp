Backlog
=====

## Implement dynamic option values

- Date: 2014-09-17
- Priority: 2
- Scheduled: NA
- Solved: NA
- Description:
  e.g. consider `<ns>/global_dir`: it is clearly dependent on `.rte/global_dir`
  
## Implement merging of nested options

- Date: 2014-09-17
- Priority: 2
- Scheduled: NA
- Solved: NA
- Description:
  Consider `mergeNamespaceRappOptions()` or, in general, the current structure of
  the option files (i.e. `/options/options_ns.r` and `/options/options_runtime.r`): currently, it is only possible to set non-nested values via the options file;
  change that.

## Ensure templates for `.Renviron`

- Date: 2014-09-19
- Priority: 1
- Scheduled: 2014-09-20
- Solved: NA
- Description:
  Ensure that `.Renviron` file is automatically copied to package projects. 
  This should contain at least the line
  
```

```
