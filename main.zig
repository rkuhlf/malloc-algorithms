const std = @import("std");

pub fn main() void {
    const buffer: [1024]u8 = undefined;
    const allocator = initAlloc(buffer);
    
    const data = try bumpAlloc(allocator, 100, 3, @returnAddress());

    const gpa = std.heap.
}

pub const BumpAllocator = struct {
    buffer: []u8,
    offset: usize,
};

fn initAlloc(buffer: []u8) *BumpAllocator {
    return BumpAllocator{
        .buffer = buffer,
        .offset = 0
    };
}

fn bumpAlloc(
    allocator: *BumpAllocator,
    len: usize,
    log2_align: u8,
    ra: usize,
) ?[*]u8 {
    _ = ra;
    const align_bits = (1 << log2_align);
    const aligned_offset = (allocator.offset + align_bits - 1) & ~(align_bits - 1);

    if (aligned_offset + len > allocator.buffer.len) return null;

    const ret = allocator.buffer[allocator.offset .. allocator.offset + len];
    allocator.offset = aligned_offset + len;
    return ret.ptr();
}
