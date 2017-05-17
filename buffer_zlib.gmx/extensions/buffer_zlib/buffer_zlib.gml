#define buffer_zlib_init
///
//#global buffer_zlib_chunk_size:
//#global buffer_zlib_available:
//#buffer_zlib_status buffer_zlib_get_status():
buffer_zlib_available = buffer_zlib_init_raw();
buffer_zlib_chunk_size = 16384;

#define buffer_deflate
/// (buffer, offset, size, level, ?outbuf):
var l_source = argument[0];
var l_length = buffer_get_size(l_source);
var l_offset = argument[1];
var l_total = l_offset + argument[2];
l_offset = clamp(l_offset, 0, l_length);
l_total = clamp(l_total, 0, l_length) - l_offset;
if (!buffer_deflate_raw1(buffer_get_address(l_source), l_offset, l_total, argument[3])) return -1;
var l_chunk = buffer_zlib_chunk_size;
var l_result, l_alloc = argument_count <= 4;
if (l_alloc) {
	l_offset = 0;
	l_length = l_chunk;
	l_result = buffer_create(l_length, buffer_grow, 1);
} else {
	l_result = argument[4];
	l_offset = buffer_tell(l_result);
	l_length = buffer_get_size(l_result);
}
var l_avail, l_address = buffer_get_address(l_result);
if (l_total > 0) do {
	l_avail = buffer_deflate_raw2(l_address, l_offset, l_length);
	if (l_avail < 0) {
		if (l_alloc) buffer_delete(l_result);
		return -1;
	} else if (l_avail == 0) {
		l_offset = l_length;
		l_length += l_chunk;
		buffer_resize(l_result, l_length);
		l_address = buffer_get_address(l_result);
	}
} until (l_avail > 0);
buffer_seek(l_result, buffer_seek_start, l_length - l_avail);
return l_result;

#define buffer_inflate
/// (buffer, offset, size, ?outbuf):
var l_c = buffer_zlib_chunk_size;
var l_b = argument[0], l_r;
var l_t = max(0, argument[1]);
if (!buffer_inflate_raw1(buffer_get_address(l_b), l_t)) return -1;
var l_z = argument_count <= 2;
if (l_z) l_r = buffer_create(l_c, buffer_grow, 1); else l_r = argument[2];
var l_qr = buffer_get_address(l_r);
var l_n = buffer_get_size(l_r), l_q;
if (l_t > 0) do {
	l_q = buffer_inflate_raw2(l_qr, buffer_tell(l_r), l_n);
	if (l_q < 0) {
		if (l_z) buffer_delete(l_r);
		return -1;
	} else if (l_q > 0) {
		l_n += l_c;
		buffer_resize(l_r, l_n);
		l_qr = buffer_get_address(l_r);
	}
	buffer_seek(l_r, buffer_seek_relative, l_q);
} until (l_q == 0);
return l_r;