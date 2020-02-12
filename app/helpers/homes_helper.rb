module HomesHelper
  def state_list
    state_codes = []
    us = Carmen::Country.coded('US')
    states = us.subregions.typed('state')
    states.each do |state|
      individual_code = state.code
      state_codes << individual_code
    end
    return state_codes
  end
end
