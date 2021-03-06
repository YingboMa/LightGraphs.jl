@testset "Degree Vertex Cover" begin

    g3 = SimpleGraph(LGGEN.Star(5))
    for g in testgraphs(g3)
        c = @inferred(LGVS.vertex_cover(g, LGVS.DegreeSubset()))
        @test c == [1,]
    end

    g4 = SimpleGraph(LGGEN.Complete(5))
    for g in testgraphs(g4)
        c = @inferred(LGVS.vertex_cover(g, LGVS.DegreeSubset()))
        @test length(c)== 4 #All except one vertex
    end

    #path_graph(5) with additional edge 2-5
    g5 = SimpleGraph([0 1 0 0 0; 1 0 1 0 1; 0 1 0 1 0; 0 0 1 0 1; 0 1 0 1 0])
    for g in testgraphs(g5)
        c = @inferred(LGVS.vertex_cover(g, LGVS.DegreeSubset()))
        @test sort(c) == [2, 4]
    end
end
