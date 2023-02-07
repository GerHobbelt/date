#ifndef EMBEDDED_DATA_H_48667019_0B25_4E59_86EA_5A0DEE22E145
#define EMBEDDED_DATA_H_48667019_0B25_4E59_86EA_5A0DEE22E145
#include <cstdint>
#include <istream>
#include <string>
#include <vector>
namespace date
{
struct membuf : std::streambuf
{
  membuf(char const* base, size_t size)
  {
    char* p(const_cast<char*>(base));
    this->setg(p, p, p + size);
  }
};
struct imemstream : virtual membuf, std::istream
{
  imemstream(uint8_t const* base, size_t offset, size_t size)
  : membuf((const char*)&base[offset], size),
    std::istream(static_cast<std::streambuf*>(this))
  {
  }
};

std::string get_embedded_tzdb_version();
std::vector<std::string> get_available_file_names();
imemstream get_stream(const std::string& filename);
imemstream get_leapseconds_file();
imemstream get_windowsZonesXML_file();
} // namespace date
#endif //EMBEDDED_DATA_H_48667019_0B25_4E59_86EA_5A0DEE22E145
