Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'Display configuration tab for brands',
  replace: 'erb[silent]:contains("current_store")',
  text: '<% if can?(:admin, current_store) || current_spree_user&.brands&.any? %>'
)
Deface::Override.new(
  virtual_path:  'spree/admin/shared/_main_menu',
  name:          'brands_main_menu_tabs',
  insert_bottom: 'nav',
  text:       <<-HTML
                <% if current_spree_user.respond_to?(:has_spree_role?) && current_spree_user.has_spree_role?(:admin) %>
                  <ul class="nav nav-sidebar border-bottom">
                    <%= tab :brand, url: admin_brands_path, icon: 'money' %>
                  </ul>
                <% end %>
                <% if defined?(current_spree_brands) && current_spree_brands %>
                  <ul class="nav nav-sidebar border-bottom">
                    <%= tab Brand.model_name.human, url: admin_brand_settings_path%>
                  </ul>
                <% end %>
HTML
)
