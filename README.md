# malloc-algorithms


## Algorithms
- Bump allocator
- Keep a pointer to the block of free memory. Always return the next spot in memory.

- Linked list of free memory.


- Arenas

<!-- Could test by filling with random bits, then checking that they're all the same. -->
<!-- Could build some testing classes, which take an allocator and return a new allocator. -->
<!-- Then I could just have a method called run allocator which receives an allocator and does a bunch of allocations with it. The performance allocators would collect the data that they want, and likewise for the correctness allocator. -->