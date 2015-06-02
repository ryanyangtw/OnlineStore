object @store

attributes :id, :name, :introduction

node(:image) { |store| store.image_url }
