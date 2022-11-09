local colorizer_status, color = pcall(require, "colorizer")
if not colorizer_status then
  return
end

color.setup()
