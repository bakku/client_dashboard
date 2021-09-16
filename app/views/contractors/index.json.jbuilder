# frozen_string_literal: true

json.array! @contractors, partial: "contractors/contractor", as: :contractor
