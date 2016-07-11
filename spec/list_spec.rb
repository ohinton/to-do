require('spec_helper')

describe(List) do

  describe('#name') do
    it ('returns a name') do
      test_list = List.new({:name => 'Epicodus Stuff', :id => nil})
      expect(test_list.name()).to(eq('Epicodus Stuff'))
    end
  end

  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a list to an array of saved lists') do
      test_list = List.new({:name => 'Epicodus Stuff', :id => nil})
      test_list.save()
      expect(List.all()).to(eq([test_list]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same description and ID") do
      list1 = List.new({:name => "learn SQL", :id => nil})
      list2 = List.new({:name => "learn SQL", :id => nil})
      expect(list1).to(eq(list2))
    end
  end
end
