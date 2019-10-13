raw_data %>% 
  filter(minimum_nights < 50) %>%  
  ggplot(aes(x = minimum_nights)) +
  geom_density() +
  theme_clean() +
  labs(x = "Minimum Nights",
       y = "Density")

pal <- colorFactor(c("navy", "red", "green"), domain = c("North", "Center", "South"))


leaflet(data = filter(clean_data, minimum_nights <= 4)) %>% 
  addProviderTiles("OpenStreetMap.Mapnik") %>% 
  addCircleMarkers(lng = ~longitude, 
                   lat = ~latitude, 
                   radius = 2, 
                   fillColor = ~pal(region_by_price), 
                   fillOpacity = 0.8, 
                   popup = ~listing_url,
                   label = ~property_type,
                   stroke = FALSE)


pal <- colorFactor(c("red", "navy", "green"), domain = c("Entire home/apt", "Private room", "Shared room"))


leaflet(data = filter(clean_data, minimum_nights <= 4)) %>% 
  addProviderTiles("OpenStreetMap.Mapnik") %>% 
  addCircleMarkers(lng = ~longitude, 
                   lat = ~latitude, 
                   radius = 2, 
                   fillColor = ~pal(room_type), 
                   fillOpacity = 0.8, 
                   popup = ~listing_url,
                   label = ~property_type,
                   stroke = FALSE)

pal <- colorQuantile("Blues", clean_data$price, n = 10)

leaflet(data = filter(clean_data, minimum_nights <= 4)) %>% 
  addProviderTiles("OpenStreetMap.Mapnik") %>% 
  addCircleMarkers(lng = ~longitude, 
                   lat = ~latitude, 
                   radius = 2, 
                   fillColor = ~pal(price), 
                   fillOpacity = 0.8, 
                   popup = ~listing_url,
                   label = ~property_type,
                   stroke = FALSE)



clean_data %>% 
  ggplot(aes(x = prop_type_simplified, fill = prop_type_simplified)) +
  geom_bar(show.legend = FALSE) +
  theme_bw() +
  labs(x = "",y = "")

clean_data %>%
  filter(host_total_listings_count < 100) %>%
  ggplot(aes(x = host_total_listings_count)) +
  geom_density(show.legend = FALSE) +
  theme_clean() +
  labs(x = "Listing per Host",
       y = "Density")
