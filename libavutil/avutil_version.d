/*
 * copyright (c) 2003 Fabrice Bellard
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */
 
module ffmpeg.libavutil.avutil_version;
 
import std.stdio;
import std.stdint;
import std.format;
import std.array;
import core.vararg;

 /**
 * @defgroup version_utils Library Version Macros
 *
 * Useful to check and match library version in order to maintain
 * backward compatibility.
 *
 * @{
 */
 
template AV_VERSION_INT(int a, int b, int c) {
  const int AV_VERSION_INT = (a<<16 | b<<8 | c);
}

string AV_VERSION_DOT(int a, int b, int c) {
  auto writer = appender!string();
  formattedWrite(writer, "%2d.%2d.%2d", a, b, c);
  return writer.data;
}

template AV_VERSION(int a, int b, int c) {
  const string AV_VERSION = AV_VERSION_DOT(a, b, c);
}

/**
 * @}
 *
 * @defgroup lavu_ver Version and Build diagnostics
 *
 * Macros and function useful to check at compiletime and at runtime
 * which version of libavutil is in use.
 *
 * @{
 */

enum LIBAVUTIL_VERSION_MAJOR = 51;
enum LIBAVUTIL_VERSION_MINOR = 55;
enum LIBAVUTIL_VERSION_MICRO = 100;

enum LIBAVUTIL_VERSION_INT = AV_VERSION_INT!(LIBAVUTIL_VERSION_MAJOR, LIBAVUTIL_VERSION_MINOR, LIBAVUTIL_VERSION_MICRO);
enum LIBAVUTIL_VERSION =     AV_VERSION!(LIBAVUTIL_VERSION_MAJOR, LIBAVUTIL_VERSION_MINOR, LIBAVUTIL_VERSION_MICRO);
enum LIBAVUTIL_BUILD =       LIBAVUTIL_VERSION_INT;

auto LIBAVUTIL_IDENT =  "Lavu" ~ LIBAVUTIL_VERSION;

/**
 * @}
 *
 * @defgroup depr_guards Deprecation guards
 * FF_API_* defines may be placed below to indicate public API that will be
 * dropped at a future version bump. The defines themselves are not part of
 * the public API and may change, break or disappear at any time.
 *
 * @{
 */

enum FF_API_GET_BITS_PER_SAMPLE_FMT = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_FIND_OPT                = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_OLD_AVOPTIONS           = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_PIX_FMT                 = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_CONTEXT_SIZE            = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_PIX_FMT_DESC            = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_AV_REVERSE              = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_AUDIOCONVERT            = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_CPU_FLAG_MMX2           = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_SAMPLES_UTILS_RETURN_ZERO = (LIBAVUTIL_VERSION_MAJOR < 53);
enum FF_API_LLS_PRIVATE              = (LIBAVUTIL_VERSION_MAJOR < 53);

/**
 * @}
 */

/**
 * Build time configuration from avconfig.h. Not sure where else to put it...
 */
enum AV_PIX_FMT_ABI_GIT_MASTER = 0;
enum AV_HAVE_BIGENDIAN= 0;
enum AV_HAVE_FAST_UNALIGNED =1;
enum AV_HAVE_INCOMPATIBLE_FORK_ABI =0;