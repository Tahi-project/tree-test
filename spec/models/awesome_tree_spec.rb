require 'rails_helper'

RSpec.describe AwesomeTree, type: :model do
  it 'should take 8 queries to add a child' do
    root = AwesomeTree.create
    child = AwesomeTree.create
    expect { root.children << child }.to make_database_queries(count: 8)
    child2 = AwesomeTree.create
    expect { root.children << child2 }.to make_database_queries(count: 8)
    child3 = AwesomeTree.create
    expect { root.children << child3 }.to make_database_queries(count: 8)
    child4 = AwesomeTree.create
    expect { child3.children << child4 }.to make_database_queries(count: 8)
  end

  it_behaves_like :tree_benchmarks
end
