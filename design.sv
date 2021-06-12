module parity(data,odd_parity,even_parity);

    input [7:0] data;
    output odd_parity;
    output even_parity;

    assign odd_parity  = ^data;
    assign even_parity = ~odd_parity;

endmodule